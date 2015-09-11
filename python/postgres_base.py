__author__ = 'highstead'

import psycopg2
import logging
from psycopg2.pool import ThreadedConnectionPool

from contextlib import contextmanager
from psycopg2.extras import RealDictCursor
from server.logic.logic_base import BaseLogic

class PostgresBase(BaseLogic):
    _POSTGRES = BaseLogic._CONFIG['Postgres']

    __MIN_CONNECTIONS = _POSTGRES['min.connections']
    __MAX_CONNECTIONS = _POSTGRES['max.connections']

    _psy_pool = psycopg2.pool.ThreadedConnectionPool(
        __MIN_CONNECTIONS, __MAX_CONNECTIONS,
        host=_POSTGRES['host'],
        database=_POSTGRES['name'],
        user=_POSTGRES['user'],
        password=_POSTGRES['password'])

    def __init__(self):
        """Instantiate base class.  Utilizing config file"""
        self.__logger = logging.getLogger('high.' + __name__)
        try:
            super(PostgresBase, self).__init__()
        except:
            self.__logger.exception(
                self._error_messages['error.postgresql.connection'])
            raise
			
    @contextmanager
    def get_real_dict_cursor(self, commit=False):
        """
        create a connection and cursor to the underlying postgres database.
        Usage: with get_real_dict_cursor() as cursor:
        at the end of the wih statment cursor and connection are closed.  if commit was specified as true, database
        changes are persisted.
        :param commit: whether any changes should be pushed to the database.
        :type commit bool
        :return:
        """
        try:
            connection = self._psy_pool.getconn()
            cursor = connection.cursor(cursor_factory=RealDictCursor)
            try:
                yield cursor
            except psycopg2.DatabaseError:
                connection.rollback()
                cursor.close()
            else:
                if commit:
                    connection.commit()
                else:
                    connection.rollback()
        finally:
            self._psy_pool.putconn(connection)

    @contextmanager
    def get_cursor(self, commit=False):
        """
        create a connection and cursor to the underlying postgres database.
        Usage: with get_cursor() as cursor:
        at the end of the wih statment cursor and connection are closed.  if commit was specified as true, database
        changes are persisted.
        :param commit: whether any changes should be pushed to the database.
        :type commit bool
        :return:
        """
        try:
            connection = self._psy_pool.getconn()
            cursor = connection.cursor()
            try:
                yield cursor
            except psycopg2.DatabaseError:
                connection.rollback()
            else:
                if commit:
                    connection.commit()
                else:
                    connection.rollback()
        finally:
            cursor.close()
            self._psy_pool.putconn(connection)
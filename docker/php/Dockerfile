FROM php:7.2.6-cli-alpine3.7

LABEL maintainer="Juan Pablo Almonacid <jpalmonacidv@gmail.com>"

###########################################################################
# blog non-root user
###########################################################################

# Add a non-root user to prevent files being created with root permissions on host machine.
ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

ENV APP_USER blog
ENV HOME_PATH /home/${APP_USER}

RUN adduser -u ${PUID} -h ${HOME_PATH} -D ${APP_USER}

###########################################################################
# composer
###########################################################################

RUN export EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)" \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && export ACTUAL_SIGNATURE="$(php -r "echo hash_file('SHA384', 'composer-setup.php');")" \
    && if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then \
        >&2 echo 'ERROR: Invalid installer signature'; \
        rm composer-setup.php; \
    fi \
    && unset EXPECTED_SIGNATURE ACTUAL_SIGNATURE \
    && php composer-setup.php --install-dir /usr/local/bin --filename composer \
    && rm composer-setup.php

ENV APP_PATH ${HOME_PATH}/app

WORKDIR ${APP_PATH}

EXPOSE 8000

CMD ["bin/console", "server:run", "-n", "0.0.0.0:8000"]

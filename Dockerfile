FROM entando/entando-base-image-432

LABEL mainteiner="Pietrangelo Masala <p.masala@entando.com>"

COPY filter-development-unix.properties /home/entando/filter-development-unix.properties

USER entando
WORKDIR /home/entando

RUN git clone https://github.com/entando/fsi-onboarding-entando.git

WORKDIR /home/entando/fsi-onboarding-entando/fsi-customer

ENTRYPOINT [ "mvn", "jetty:run" ]

EXPOSE 8080

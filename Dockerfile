# This is the docker hub image
FROM entando/entando-docker-base-image

LABEL mainteiner="Pietrangelo Masala <p.masala@entando.com>"

USER entando
WORKDIR /home/entando

RUN git clone https://github.com/entando/fsi-onboarding-entando.git

WORKDIR /home/entando/fsi-onboarding-entando/fsi-customer

ENTRYPOINT [ "mvn", "jetty:run" ]

EXPOSE 8080

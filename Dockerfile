# This is the docker hub image
FROM pmasala/entando-base-image-432

LABEL mainteiner="Pietrangelo Masala <p.masala@entando.com>"

COPY filter-development-unix.properties /home/entando/filter-development-unix.properties

USER entando
WORKDIR /home/entando

RUN git clone https://github.com/entando/fsi-onboarding-entando.git \
&& rm -f fsi-onboarding-entando/fsi-customer/src/main/filters/filter-development-unix.properties \
&& cp filter-development-unix.properties fsi-onboarding-entando/fsi-customer/src/main/filters/

WORKDIR /home/entando/fsi-onboarding-entando/fsi-customer

ENTRYPOINT [ "mvn", "jetty:run" ]

EXPOSE 8080

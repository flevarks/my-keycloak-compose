FROM quay.io/keycloak/keycloak:25.0 as builder
ENV KC_METRICS_ENABLED=true
ENV KC_HTTP_RELATIVE_PATH=/auth
ENV KC_FEATURES=token-exchange
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:25.0
COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/

WORKDIR /opt/keycloak

COPY ./odin-login-page-keycloak-theme-4.7.2.jar /opt/keycloak/providers

ENV KC_LOG_LEVEL=INFO

ENV KC_PROXY=edge
# ENV KC_HTTP_ENABLED=true        # superfluous since included in proxy=edge
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
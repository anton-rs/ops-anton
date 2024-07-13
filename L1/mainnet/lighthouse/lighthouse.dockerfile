FROM sigp/lighthouse:latest

COPY lighthouse/lighthouse.sh .
RUN chmod +x lighthouse.sh
COPY jwttoken/jwt.hex .

ENTRYPOINT ["./lighthouse.sh"]

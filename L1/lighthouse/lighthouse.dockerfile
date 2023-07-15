FROM sigp/lighthouse

COPY lighthouse/lighthouse.sh .
RUN chmod +x lighthouse.sh
COPY .secret .

ENTRYPOINT ["./lighthouse.sh"]

FROM java:8
VOLUME /tmp
COPY app-results.jar app.jar
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://172.17.8.101:27017/votingapp","-jar","/app.jar"]
EXPOSE 1222

# docker build -f Dockerfile -t results_img .
# docker run -d --name results -p 1222:1222 results_img

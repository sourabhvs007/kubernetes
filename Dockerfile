FROM ruby:2.1.2
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y net-tools && apt-get install -y nodejs
COPY . /ruby-blog
RUN cd /ruby-blog && bundle install 
WORKDIR /ruby-blog
EXPOSE 3000 80
CMD ["rails","s","-b","0.0.0.0","-p","80"]

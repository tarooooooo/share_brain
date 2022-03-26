FROM ruby:2.7.4

ENV RAILS_ENV=production

# yarnパッケージ管理ツールをインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

RUN apt-get update -qq && apt-get install -y nodejs yarn
RUN mkdir /share_brain
WORKDIR /share_brain
COPY Gemfile /share_brain/Gemfile
COPY Gemfile.lock /share_brain/Gemfile.lock
RUN bundle install
COPY . /share_brain

RUN curl -sL https://deb.nodesource.com/setup_14.x
#RUN yarn install --check-files
#RUN bundle exec rails webpacker:compile

# コンテナ起動時に実行させるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Rails サーバ起動
CMD ["rails", "server", "-b", "0.0.0.0"]

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD["sh", "/start.sh"]

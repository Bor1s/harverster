get '/games/metadata' do
  json {env: environment, subscriptions: Subscription.all.to_a}
end

get '/games/top' do
  json GameService.top
end

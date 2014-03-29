get '/games/metadata' do
  json({env: settings.production?, subscriptions: Subscription.all.to_a})
end

get '/games/top' do
  json(GameService.top)
end

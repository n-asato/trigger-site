# Rack::Attack configuration for rate limiting
# Protect against brute-force login attempts

class Rack::Attack
  # Throttle login attempts by IP address
  throttle('admin/login/ip', limit: 5, period: 60.seconds) do |req|
    if req.path == '/admin/login' && req.post?
      req.ip
    end
  end

  # Throttle login attempts by username (if provided)
  throttle('admin/login/username', limit: 5, period: 60.seconds) do |req|
    if req.path == '/admin/login' && req.post?
      req.params['username'].to_s.downcase.gsub(/\s+/, '')
    end
  end

  # Block suspicious requests (optional: uncomment if needed)
  # blocklist('block bad actors') do |req|
  #   Rack::Attack::Fail2Ban.filter("fail2ban-#{req.ip}", maxretry: 10, findtime: 1.minute, bantime: 1.hour) do
  #     req.path == '/admin/login' && req.post?
  #   end
  # end

  # Custom response for throttled requests
  self.throttled_responder = lambda do |request|
    [429, { 'Content-Type' => 'text/plain' }, ["Too many requests. Please try again later.\n"]]
  end

  # Throttle contact form submissions by IP address
  throttle('contact/ip', limit: 5, period: 60.seconds) do |req|
    if req.path == '/contact' && req.post?
      req.ip
    end
  end
end

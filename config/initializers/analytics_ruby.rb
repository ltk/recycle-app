Analytics = AnalyticsRuby       # Alias for convenience
Analytics.init({
    secret: '7jpe2fw4ke',          # The write key for plusfoam/reclaim
    on_error: Proc.new { |status, msg| print msg }  # Optional error handler
})
Analytics = AnalyticsRuby       # Alias for convenience
Analytics.init({
    # I feel like you don't want this checked into the source.
    on_error: Proc.new { |status, msg| print msg }  # Optional error handler
})

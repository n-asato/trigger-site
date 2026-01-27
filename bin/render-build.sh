#!/usr/bin/env bash
# exit on error
set -o errexit

echo "--- Building assets ---"
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean

echo "--- Running migrations ---"
bundle exec rake db:migrate

echo "--- Generating sitemap ---"
bundle exec rake sitemap:refresh

echo "--- Build complete ---"

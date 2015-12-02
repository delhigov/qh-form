#!/bin/bash
git checkout production
RAILS_ENV=production bundle exec rake assets:precompile
git add public/assets
git commit -m "vendor compiled assets"
git push
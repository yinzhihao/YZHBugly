
pod lib lint --use-libraries --allow-warnings
git add .
git commit -m ''
git push
git tag 0.1.0
git push origin 0.1.0

pod spec lint --use-libraries --allow-warnings
pod trunk push --use-libraries --allow-warnings


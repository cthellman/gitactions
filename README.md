# gitactions

This is a demonstration of github-actions;
- Triggered on a push
- Tag the commit, bumping up the minor version with 1 unless #major or #none is specified
- Build the application
- Push the docker-image to dockerhub using the tag provided

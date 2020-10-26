# Troubleshooting

### ConnectionError

If the X Server returns an error when establishing a connection, an exception of type `ConnectionError` is raised. One common source of error is a badly set `DISPLAY` environment variable. Common values are `:0` or `:1`.
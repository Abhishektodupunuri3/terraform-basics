
### How to delete a file of a specific version using AWS CLI COMMANDS

1) aws s3api list-object-versions --bucket your-bucket-name

2) aws s3api delete-objects --bucket your-bucket-name --delete file://path/to/deletion/file.json

```    {
    "Objects": [
        {
        "Key": "object-key",
        "VersionId": "version-id"
        },
        {
        "Key": "another-object-key",
        "VersionId": "another-version-id"
        }
    ]
    }
```
local required(name) = error("Undefined required argument in app(): Please provide `%s`" % name);
{
  app(
    name = required("name"),
    image = required("image"),
    tag = "latest"
  ): {
    "kind": "Deployment",
    "apiVersion": "apps/v1",
    "metadata": {
        "name": name,
        "labels": {
            "app": name
        }
    },
    "spec": {
        "replicas": 1,
        "selector": {
            "matchLabels": {
                "app": name
            }
        },
        "template": {
            "metadata": {
                "labels": {
                    "app": name
                }
            },
            "spec": {
                "containers": [
                    {
                        "name": name,
                        "image": image + "@" + std.rstripChars(tag, '\n'),
                    }
                ]
            }
        },
    }
  }
}

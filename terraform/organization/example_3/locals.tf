locals {
    s3 = {
        bucket_name = "3f328a4f-6ad2-40eb-b323-f30938e3b08a-cloud-tp3"
        path        = "../../resources"

        objects = {
            index = {
                filename     = "html/index.html"
                content_type = "text/html"
            }
            error = {
                filename     = "html/error.html"
                content_type = "text/html"
            }
            hortz = {
                filename     = "images/hortz.png"
                content_type = "image/png"
            }
            pepe = {
                filename     = "images/pepe.png"
                content_type = "image/png"
            }
        }
    }
}
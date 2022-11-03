fork from: https://github.com/Paul-DS/synology-upload-file-request

Usage:

1. create a file request from you synology file station
2. add yml to your workflow

```
      - name: Synology Uploader
        uses: leconio/synology-uploader-action@v1.0.4
        with:
          host: ${{secrets.NAS_HOST}}
          sharing_id: ${{secrets.NAS_SHAREID}}
          uploader_name: ${{secrets.NAS_NAME}}
          password: ${{secrets.NAS_PASSWD}}
          file: 'hello.txt'
```

<h3 dir="auto" style="box-sizing: border-box; margin-top: 24px; margin-bottom: 16px; font-size: 1.25em; font-weight: 600; line-height: 1.25; color: rgb(36, 41, 47); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Options</h3>

| Parameter     | Required | Description                                                                                                                                                              |
| ------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| host          | Required | Host name of the Synology NAS, including the protocol (HTTP/HTTPS) and the port, without trailing slashExamples: http://192.168.0.123:5000, https://www.example.com:1234 |
| sharing_id    | Required | Sharing ID provided by Synology.Example: if the URL provided is https://www.example.com/sharing/abcdef12, the Sharing ID would be abcdef12                               |
| password      | Optional | The password for the file request, if defined                                                                                                                            |
| file          | Required | The file to upload                                                                                                                                                       |
| uploader_name | Required | Uploader name                                                                                                                                                            |

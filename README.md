# Home Assistant Add-on: Ingress Wrapper

Proxy That uses Home Assistant Ingress and Nginx to map any local port

Supports websockets.



This is a fork of https://github.com/arybitskiy/hassio-addon-ingress-nginx-proxy

## Add-On Customization

1 - Using SSH, go to the `~/addons/` folder on your Home Assistant instance.

2 - Clone the repo and choose a customized folder name, like `my-addon`:
```bash
$ git clone https://github.com/marciogranzotto/ingress-wrapper.git my-addon
```

3 - Enter your folder:
```bash
$ cd my-addon
```

4 - Run the customization script to change the Add-On name, slug and panel icon:
```bash
$ python3 create_addon.py
Enter the desired add-on name: My Addon
Enter the slug: my-addon
Enter side pannel icon (like mdi:car): mdi:sitemap

Reading config.json...
Editting config.json...
Saving config.json...
Done!
```

5 - Change `icon.png` and `logo.png` with your desired images

6 - Go to the Add-On store page, reload it on the overflow menu, your new add-on should appear

7 - Install it and set the local address and port on the Configuration tab

8 - Profit!
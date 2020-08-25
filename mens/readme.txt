■コメント


VirtualService:demo に以下を追記する。


    - match:
        - uri:
            exact: /find
      route:
        - destination:
            host: finder
            port:
              number: 8080






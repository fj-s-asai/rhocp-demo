���R�����g


VirtualService:demo �Ɉȉ���ǋL����B


    - match:
        - uri:
            exact: /find
      route:
        - destination:
            host: finder
            port:
              number: 8080






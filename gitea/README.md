# GiteaとDroneでセルフホストのGitサーバーとCIサーバーをたてる

## Gitea Actionsがリリースされたのでそっちを使う

- https://qiita.com/sinsky/items/5ab6017f82548f9e35e6
- デフォルトでは、actのバージョンがMinimumなため、ubuntu-latestとしてもnodejsのイメージがぷるされる
  - そのため、./runner/config.yamlのラベルにあるようにイメージのタグを指定し、それをCONFIG_FILEで実行時に指定すること
  - https://docs.gitea.com/usage/actions/act-runner#runner-levels
  - 例：
```yaml
services:
# docker-compose.ymlで、
  runner:
     build:
       context: ./act_runner
       dockerfile: Dockerfile
     container_name: vm-gitea-runner
     restart: always
     environment:
       GITEA_INSTANCE_URL: http://10.254.249.89
       GITEA_RUNNER_REGISTRATION_TOKEN: LXv621V6pMJPsLRE1PDEEAYvQUgNzIOUpVpWtYpl
       GITEA_RUNNER_NAME: test-runner
       GITEA_RUNNER_LABELS: ubuntu-latest,ubuntu-22.04,ubuntu-20.04,ubuntu-18.04
       CONFIG_FILE: /runner/config.yaml
     networks:
       gitea_network:
     volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./runner/:/runner:ro

  db:
```

## 旧バージョン（Drone使用）
- 手順
  - docker-compose upした後、
  - Giteaの初期設定画面で管理者アカウントの設定をする。
    - adminユーザーは予約されているのでこれ以外
    - ここで作ったユーザーでログインするので必須？
  - ここまでですでにレポジトリのプッシュとかはできるはず
  - drone用のアプリケーションの作成
    - 参考：https://docs.drone.digitalstacks.net/l/ja/provider/gitea　
    - adminユーザーで管理者設定からアプリケーション→Oauth2アプリケーションの作成
      - アプリケーション名 : `drone`
      - url : `http://10.254.249.87:8090/login`
    - 作成に成功するとOauth2のログインに必要なクライアントIDとシークレットIDが作成されるのでDroneのランナーに反映する
  - 登録
    - droneを開く（http://localhost:8090 )
    - giteaのログインページ似遷移するのでログインする
    - authのクライアントIDが正常に設定されていると登録できる
       - 「アプリケーションを許可」ボタンを押す
       - ↑でGiteaアプリケーション作成時に設定したURLにリダイレクトされる
         - リダイレクト先がIPだとうまく行かないかもなのでlocalhostとかにして適宜書き換える
    - Droneのアカウント登録画面になるので登録する
      - 成功すると、`.drone.yml`があるレポジトリが表示されているはずなので、そいつをActivateする
    - Droneの画面の右上の「New Build」ボタンから新しくCIを追加できる


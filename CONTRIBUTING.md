# コントリビュートガイド

## 対象者

Issue・Pull Requestは **岡山大学電子計算機研究会の GitHub Organization メンバーのみ** 受け付けています

構成員には招待を行いますので，`GitHub`アカウントを作成した場合はご一報ください

## 作業手順

1. `main` から作業ブランチを作成する

   ```sh
   git switch -c fix/your-branch-name main
   ```

2. `.typ` ファイルを編集し，PDF を生成する ([Typst](https://typst.app/) が必要)

3. `.typ` と `.pdf` の両方をコミットして，`main` ブランチへ PR を作成する

4. PR を作成したら，**レビューをリクエスト** する

## 判例の追加

会則の解釈・運用に関する事例は `事例/` ディレクトリに追加してください
詳しくは [`事例/README.md`](事例/README.md) を参照してください

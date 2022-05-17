## 画面遷移図

https://www.figma.com/file/k6HIjQdRzYpwbm3FgFN297/Flowcharts-Web?node-id=0%3A1

## ER図

https://drive.google.com/file/d/1SdvmUoUEO0hZty7Lgw9l8mDQxew5EVtv/view?usp=sharing


## 開発環境

ruby 2.6.5p114 (2019-10-01 revision 67812) [-darwin21]
Rails 6.0.5
node v15.14.0
yarn 1.22.17

## サービス概要

コミュニティ・フリーマーケット

### 3 行で

信頼できるコミュニティの中で、もののやり取りをしたいと考えている人たちに
気軽に出品/購買をできるようにする
クローズドの CtoC フリマアプリです

### 登場人物

- エンドユーザー

  - 出品者
  - 購入者

- 管理者

  - 出品物の情報を管理する人
  - 取引の情報を管理する人
  - ユーザー(出品者)の情報を管理する人
  - ユーザー(購入者)の情報を管理する人

### ユーザーが抱える課題

to-be(理想の姿)
・自分が使ってきた書籍やキーボードなどのツールがある。
・もう読まない/新しいものを買ったなどの理由で手放したい。
・せっかくであれば後輩や同期など信頼の寄せられる人のためになってほしい。

as-is(現状と課題)
・ただ、slack や SNS での投稿では、一般的な投稿内容ではないので遠慮がある。
・加えて、"その瞬間"に欲しい人がいないと流れてしまう。
・また、メルカリなどに出品するには、きれいな出品写真/包装/やり取り/決済/送付作業などでめんどうである。

### 解決方法

・まとめると「遠慮、情報が流れてしまう、手間」の 3 つの課題がある。
・コミュニティとして CtoC のフリマアプリを導入することでこれら 3 つの課題を解決する。

- 遠慮 → 「コミュニティとしてフリマアプリを入れた」という事実が体裁を作ってくれる
- 情報が流れてしまう → 出品情報がストックされていることで流れない
- 手間 → 信頼できるコミュニティであるので「きれいな出品写真/包装/やり取り/決済/送付作業」の部分が多少雑でも構わない

### プロダクト

クローズドの CtoC フリマアプリ

※写真を気軽に撮って投稿することを考えるとスマホアプリがいいけど...slack から出品できるとかにすれば web アプリのままでもいいかも？

### マーケット

20-30 代の IT 業界の会社員

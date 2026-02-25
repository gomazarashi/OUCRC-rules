
#let global-enum-counter = counter("global-enum")

#let clubru = (
  title: "部会則",
  subtitle: none,
  draft: false,
  // 発行日
  in-effect: "24.01.2024",
  // 上書き
  size: 11pt,
  font: "Harano Aji Mincho",
  lang: "ja",
  paper: "a4",
  body,
) => {
  /// Metadata
  set document(title: title)


  let tmp = if draft {}

  set page(paper: paper, numbering: "1 / 1")
  set text(hyphenate: true, lang: lang, size: size, font: font)
  set par(leading: 1em)

  // ナンバリング設定
  set enum(
    numbering: (..numbers) => {
      let nums = numbers.pos()
      if (nums.len() == 1) {
        global-enum-counter.step()
        context global-enum-counter.display(n => {
          "第" + box(width: 1em, [#align(center)[#n]]) + "条"
        })
      } else if (nums.len() == 2) {
        numbering(
          n => {
            box(width: 1em, [#align(center)[#n]]) + ")"
          },
          ..nums.slice(1),
        )
      } else if (nums.len() == 3) {
        numbering("a", ..nums.slice(2))
      } else {
        numbering("i.", ..nums.slice(4))
      }
    },
    full: true,
  )

  /// 見出し設定
  show heading: it => {
    set text(weight: "regular", size: size - 0.1em, font: "Harano Aji Gothic")
    set align(left)
    [#h(0.5em) ( #it.body )]
    v(-0.7em)
  }

  set footnote(numbering: "[1]")

  /// タイトル表示
  align(center)[
    #par(text(1.2em, strong[#title]))
    #v(0.4em)
    #par(text(1.2em, strong[#subtitle]))
    #v(1em)]
  align(right)[
    #par(text(1em, if not draft {
      [制定 #h(1em)  #in-effect]
    } else {
      [起草中]
    }))
    #v(1em)
  ]

  /// Content
  body
}

// Supplementary Provisions
#let supp = {
  v(1em)
  h(1em)
  strong[附則]
}

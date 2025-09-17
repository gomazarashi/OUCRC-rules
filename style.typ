
#let clubru = (
  title: "部会則",
  draft: false,
  // 発行日
  in-effect: "24.01.2024",
  // 上書き
  size: 12pt,
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

  // ナンバリング設定
  set enum(
    numbering: (..numbers) => {
      let nums = numbers.pos()
      if (nums.len() == 1) {
        return numbering("第1条.", ..nums)
      } else if (nums.len() == 2) {
        return numbering("a)", ..nums.slice(1))
      } else if (nums.len() == 3) {
        let letter = numbering("a", ..nums.slice(2))
        return [ #letter#letter) ]
      } else if (nums.len() == 4) {
        return numbering("(1)", ..nums.slice(3))
      } else {
        return numbering("i.", ..nums.slice(4))
      }
    },
    full: true,
  )

  /// 見出し設定
  set heading(numbering: (..nums) => {
    let nums = nums.pos()

    let number = nums.slice(nums.len() - 1)
    let str = numbering("1.1", ..number)
    [#str \ ]
  })
  show heading: set align(center)
  show heading: set text(weight: "bold")

  set footnote(numbering: "[1]")

  /// Content
  body
}

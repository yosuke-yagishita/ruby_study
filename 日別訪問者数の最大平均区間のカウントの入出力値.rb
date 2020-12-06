# あなたは、とあるウェブサイトを管理していました。
# ある連続したk日間、このウェブサイトでキャンペーンを行ったのですが、いつからいつまでの期間に行ったかを忘れてしまいました。

# 幸い、ウェブサイトを運営していた全n日分のアクセスログが残っており、1日ごとの訪問者数が分かっています。
# とりあえず、連続するk日の中で、1日あたりの平均訪問者数が最も多い期間を、キャンペーンを行った期間の候補だと考えることにしました。

# n日分の訪問者数のリストとキャンペーンの日数kが入力されるので、キャンペーンを行った期間の候補数と、候補の中で最も早い開始日を出力してください。

# 入力例1
# 5 3
# 1 2 3 2 1

# 出力例1
# 1 2

# 入力例2
# 10 2
# 6 2 0 7 1 3 5 3 2 6

# 出力例2
# 5 1

count, range = gets.split(' ').map(&:to_i)
visitor_date = gets.split(' ').map(&:to_f)
visitor_sum = []
visitor_date.each_cons(range){|visitor| visitor_sum << visitor.sum}

# 期間中の平均訪問者数
visitor_ave = []
visitor_sum.each do |visitor|
  visitor_ave << visitor / range
end

# イベント期間内の最大来客数の算出
visitor_ave_max = 0
visitor_ave.each do |i|
  if visitor_ave_max < i
    visitor_ave_max = i
  end
end

# イベント開始時期の算出
start_date = 0
visitor_ave.each do |visitor|
  if visitor == visitor_ave_max
    break
  else
    start_date += 1
  end
end

#キャンペーンを行った期間の候補数
candidate = 0
visitor_ave.each do |visitor|
  if visitor == visitor_ave_max
    candidate += 1
  end
end

puts "#{candidate} #{start_date + 1}"
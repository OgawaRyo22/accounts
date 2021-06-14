=begin

①家計簿Sqlite3テーブル に
　a.金額のデータ{動いた金額,動いた日付,説明,(タグ,サムネイル,)}
　b.合計金額のデータ を 
②入れ 
③シェルスクリプト に
->OK
　テーブル内のデーター を（装飾を施して）
④（固定）表示す

=end


module Warning
  def warn(str)
      return if str.match?("gems")

    super
      end
      end

$VERBOSE = true

require 'rubygems'
require 'bundler/setup'
Bundler.require
require 'active_record'
require 'pry'
require 'rainbow'


ActiveRecord::Base.establish_connection("sqlite3:accounts.sqlite3")




class Accout < ActiveRecord::Base
end

puts "\e[1m★ 家計簿（口座残金 - クレジット支出）★\e[0m"
puts ""
printf("%-3s", "\e[4mNo ")
printf("%-5s", "日付")
printf("%-12s", "\e[4;30;42m 金額      \e[0m\e[4m ")
printf("%-30s", "備考                        \e[0m ")
puts ""


accouts = Accout.all.limit(10)

  kane = []
accouts.each do |accout|
  movemon = accout.moved_money
  date = accout.created_datetime
  #print " ", "\e[1m", accout.account_id, "\e[0m", " | ￥", movemon.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,'), " | ", accout.title, " | ", accout.created_datetime
  print ""
  printf("%-3s", accout.account_id)
  printf("%-5s", date.strftime("%m/%d  "))
  if movemon < 0 then
   print ""
   print "\033[48;5;0m ¥\033[38;5;1m"
   printf("%-8s", movemon.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,'))
   print " \e[0m"
  elsif movemon >= 0 then
   print ""
   print "\033[48;5;0m ¥"
   printf("%-8s", movemon.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,'))
   print " \e[0m"
  end
  print " "
  printf("%-30s", accout.title)
  puts ""
  #exec( "while true; do clear; echo -e 'accout.account_id | accout.moved_money accout.title | accout.created_datetime \n以上'; sleep 2s; done" 

end
  puts ""

accouts.each do |accout|

 kane << accout.moved_money
 
end
print "      ", "SUM= ¥", kane.sum.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,')
print "\e[0m"

# .to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,') は数字にカンマをいれる際の正規表現
=begin

（引用:http://rubytips86.hatenablog.com/entry/2014/03/28/153843）この(\d)(?=\d{3}+$)という少し複雑な正規表現は、末尾から3n + 1番目の数値1桁にマッチするものだ。末尾から3n + 1番目の数値だけにマッチさせるため、まず3n個の数値を(?=\d{3}+$)という肯定先読みで処理している。

=end

=begin

do

 post = Accout.create({
   moved_money: params[moved_money],
   title: params[title]
 })

end

class Post < ActiveRecord::Base
 validates :title,
 presence: true
end

=end



#outputs color table to console, regular and bold modes



function date_translator(input, seg)
   if (input == "dd") then
      --- Candidate(type, start, end, text, comment)
      yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
   end
  if (input == "ww") then
     arr = {"一","二","三","四","五","六"}
     arr[0] = "日"
     yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d 星期"..arr[tonumber(os.date("%w"))]), ""))
  end
  if (input == "tt") then
     yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), ""))
     yield(Candidate("date", seg.start, seg._end, os.date("%H:%M:%S"), ""))
  end
end
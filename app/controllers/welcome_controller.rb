class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "五大国人口与GDP对比 [2009]")
      f.xAxis(:categories => ["美国", "日本", "中国", "德国", "法国"])
      f.series(:name => "GDP(10亿)", :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656])
      f.series(:name => "人口(百万)", :yAxis => 1, :data => [310, 127, 1340, 81, 65])

      f.yAxis [
        {:title => {:text => "GDP(10亿)", :margin => 70} },
        {:title => {:text => "人口(百万)"}, :opposite => true},
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
    end
  end
end

class ReportsController < ApplicationController
  def index
    #@recibos = current_user.receipts.joins(:business).select('receipts.total,businesses.name').group(:'business.name').sum(:total)
    #@recibos = current_user.receipts.joins(:business).select('receipts.total,businesses.name').group('businesses.name').sum(:total)
    @recibos = current_user.receipts.joins(:business).select('receipts.total,businesses.name').group('businesses.name').order('sum_total desc').sum(:total)
    @totVal = current_user.receipts.sum(:total)
    #@second = current_user.receipts.joins(:business).joins("INNER JOIN lists ON receipts.list_id = lists.id").joins("INNER JOIN list_entries on receipts.list_entry_id = list_entries.id").select('receipts.total,businesses.name,lists.name,list_entries.name').group('businesses.name,lists.name,list_entries.name').sum(:total)
    # @third = current_user.receipts.joins(:account).select('receipts.total,accounts.alias').group('accounts.alias').sum(:total)
    @doot = helpers.pieChartMaker(@recibos, @totVal)
    # @allRcpts = current_user.receipts.select(Date.parse(:purchase_date).strftime('%m').to_i)
    # @byMonth = @allRcpts.sum(:total).group_by { |u| u.purchase_date.month }
    # @byMonth = @allRcpts.select(Date.parse(:purchase_date).strftime('%m')).group(Date.parse(:purchase_date).strftime('%m'))
    # @byMonth = current_user.receipts.group_by { |r| r.purchase_date.strftime('%m')}

    # @whyme = current_user.receipts.joins(:business,:list).select('receipts.total','businesses.name beep',"cast(strftime('%m', receipts.purchase_date) as int) month",'lists.name category').to_a
    # @whyme = current_user.receipts.joins(:business).select('receipts.total','businesses.name beep',"cast(strftime('%m', receipts.purchase_date) as int) month").to_a
    @whyme = current_user.receipts.joins('inner join businesses on receipts.business_id = businesses.id inner join lists on receipts.list_id = lists.id inner join list_entries on receipts.list_entry_id = list_entries.id').select('receipts.total','businesses.name beep',"cast(strftime('%m', receipts.purchase_date) as int) month,cast(strftime('%Y',receipts.purchase_date) as int) year,lists.name category,list_entries.name subcategory")
    #@byMonth = @whyme.group_by { |r| r.month }.to_a
    #@tester = @byMonth.each do |month|
      #@tester.sum(month.total)
    #end

    #@trip.costs
     #.where(user_id: current_user)
     #.group("exchange_id")
     #.sum(:the_field_you_want_to_sum_by)

    #@byMonth = @whyme.group('month').sum(:total)
    #@byMonth = current_user.receipts.sum(:total).group("cast(strftime('%m', receipts.purchase_date) as int) month")
    @tester = @current_user.receipts.group("cast(strftime('%m', receipts.purchase_date) as int)").sum(:total)
    @byMonth = helpers.pieChartMaker(@tester.map{ |k, v| [Date::ABBR_MONTHNAMES[k], v]},@totVal)

    @beep = helpers.pieChartMaker(@current_user.receipts.group("cast(strftime('%m', receipts.purchase_date) as int)").sum(:total), @totVal)
    @byVendor = helpers.pieChartMaker(current_user.receipts.joins(:business).select('receipts.total,businesses.name').group('businesses.name').sum(:total), @totVal)
    #@dooby = @current_user.receipts.joins('inner join list_entries on receipts.list_entry_id = list_entries.id inner join lists on list_entries.list_id = lists.id').group('lists.name + " - " + list_entries.name').sum(:total)
    # this "works" @dooby = @current_user.receipts.joins('inner join list_entries on receipts.list_entry_id = list_entries.id inner join lists on list_entries.list_id = lists.id').group(["lists.name","list_entries.name"]).sum(:total)
    @dooby = @current_user.receipts.joins('inner join list_entries on receipts.list_entry_id = list_entries.id inner join lists on list_entries.list_id = lists.id').group("lists.name","list_entries.name").sum(:total)
    @boogy = @dooby.map { |k, v| [k[0].to_s + " - " + k[1].to_s,v]}

    #Rails.logger.debug @dooby
    @byCategory = helpers.pieChartMaker(@boogy, @totVal)
    @byAccount = @current_user.receipts.joins(:account).group('accounts.account_number','accounts.alias').sum(:total)
    Rails.logger.debug @byAccount
    @byAccount = @byAccount.map{ |k, v| ["*" + k[0].to_s + '('+k[1].to_s+')',v] }
    Rails.logger.debug @byAccount
    @byAccount = helpers.pieChartMaker(@byAccount, @totVal)
    @byQuarter = helpers.pieChartMaker(@current_user.receipts.group("cast(strftime('%m', receipts.purchase_date)/4 as int)").sum(:total).map { |k, v| ['Quarter: '+(k + 1).to_s,v]}, @totVal)
  end
end

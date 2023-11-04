class ReportsController < ApplicationController
  def index
    #@recibos = current_user.receipts.joins(:business).select('receipts.total,businesses.name').group(:'business.name').sum(:total)
    @recibos = current_user.receipts.joins(:business).select('receipts.total,businesses.name').group('businesses.name').sum(:total)
    @second = current_user.receipts.joins(:business).joins("INNER JOIN lists ON receipts.list_id = lists.id").joins("INNER JOIN list_entries on receipts.list_entry_id = list_entries.id").select('receipts.total,businesses.name,lists.name,list_entries.name').group('businesses.name,lists.name,list_entries.name').sum(:total)
    @third = current_user.receipts.joins(:account).select('receipts.total,accounts.alias').group('accounts.alias').sum(:total)
  end
end

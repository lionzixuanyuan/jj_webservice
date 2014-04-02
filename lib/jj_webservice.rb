require "jj_webservice/version"
require 'savon'

module JjWebservice
  # Your code goes here...
  class MallInfo
    URL = "http://113.106.58.41:8081/JJInterface.asmx"

    def initialize mall_id
      @mall_id = mall_id
      @client = Savon.new("#{URL}?wsdl")
    end

    def request(name, params={})
      op = @client.operation 'Service', 'ServiceSoap', name
      params.merge!(mallid: @mall_id)
      op.body = {name => params}
      n = name.to_s.underscore
      op.call.hash[:envelope][:body]["#{n}_response".to_sym]["#{n}_result".to_sym]
    end

    def get_vip_info card_no
      request(:GetVipInfo, vipno: card_no)[:diffgram]
    end
  end
end

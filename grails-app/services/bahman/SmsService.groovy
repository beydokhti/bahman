package bahman

class SmsService {

    def sendSms(String message,String mobileNo) {

                if (mobileNo!=null && mobileNo!="" && mobileNo.length()!=0 )  {
                    def sms=new Sms()
                    sms.message=message
                    sms.mobileNo=mobileNo
                    sms.sentDate=new Date()
                    sms.save()

                }

    }
}

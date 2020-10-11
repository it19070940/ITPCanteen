const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().functions);

var newData;
exports.noticeAddedComp = functions.database.ref('orders/{canteenName}/{userName}').onCreate( async (evt,context) =>  {


//     var typeText='New '+temp.type;
        var title = 'New Order From '+context.params.userName;
        var body= context.params.canteenName+"";
   const payload = {
        notification:{
            title : title,
            body : body,
            sound : 'default',

        },
        data:{
        message : 'my message',
        click_action : 'FLUTTER_NOTIFICATION_CLICK',
        }
    };
            //await admin.messaging().sendToDevice(token,payload);
            admin.messaging().sendToTopic(body,payload);


});

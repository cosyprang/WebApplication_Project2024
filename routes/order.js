var express = require('express');

var router = express.Router();

var database = require('../database');

router.get('/', function (req, res, next) {
    res.render('order/order',{ title: 'Order'});
});

router.post('/', function (req, res, next) {
  
    var noodles_type_tempEN = req.body.noodlesEN;
    var meat_type_tempEN = req.body.meatEN;
    var add_veg_tempEN = req.body.vegEN;
    var add_topping_tempEN = req.body.topEN;
  
    const queryString = 'INSERT INTO order_detail (noodlesEN, meatEN, vegEN, topEN) VALUES (?, ?, ?, ?)';
    database.query(queryString, [noodles_type_tempEN, meat_type_tempEN, add_veg_tempEN, add_topping_tempEN],(err, data) => {
      if(err){
        console.error(err);
      }
      else console.log("Query Successfully.");
    });

});

// router.get('/noodles', function (req, res, next) {
//     res.render('order/noodles',{ title: 'Noodles'});
// });

// router.get('/meat', function (req, res, next) {
//     res.render('order/meat',{ title: 'Meat'});
// });

// router.get('/topping', function (req, res, next) {
//     res.render('order/topping',{ title: 'Topping'});
// });

// router.get('/add-on', function (req, res, next) {
//     res.render('order/add-on',{ title: 'Add-on'});
// });

// router.post('/showData', function(req, res, next) {
//     var order_id_temp = req.body.order_id;
//     var detail_id_temp = req.body.detail_id;
//     var customer_id = req.body.customer_id;
  
//     const queryString = 'INSERT INTO temp_order (order_id, detail_id, customer_id) VALUES (?, ?, ?)';
//     database.query(queryString, [order_id_temp, detail_id_temp, customer_id],(err, data) => {
//       if(err){
//         console.error(err);
//       }
//       else console.log("Query Successfully.");

//       res.render("order/showData", {title: 'showData'});
//     });

//   });

///////////// Link to Show Data Table  /////////////

// router.get('/showData', function (req, res, next) {
//     res.render('order/showData',{ title: 'showData'});
// });

module.exports = router;
new Vue({
    el: '#xem-payment-check',
    data: {
        message: '送金されていません',
        isLoading: true,
    },
    mounted: function () {
        var that = this
        var timer = setInterval(function () {
            that.checkAddress()
            // Stop if transaction confirmed
            if (that.isLoading == false) {
                clearInterval(timer)
            }
        }, 20000)
    },
    methods: {
        checkAddress: function () {
            var that = this
            this.axios.get(Settings.xem_end_point, {
                params: {
                    xem_address: Settings.xem_address,
                    xem_message: Settings.xem_message,
                    xem_price: Settings.xem_price,
                    sale_id: Settings.sale_id,
                }
            }).then(function (res) {
                console.log(res)
                if (res.status == '200') {
                    if (res.data.status == "OK") {
                        that.message = res.data.message
                        if (res.data.confirmed == true) {
                            that.isLoading = false
                        }
                    }
                }
            }).catch(function (error) {
                concosle.log(error)
                that.message = '送金確認でエラーが発生しました'
            });
        }
    }

})
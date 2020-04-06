export default{
    getListProduct({commit},_this){
        axios.get('/api/v1/product')
            .then(function(response){
                _this.listProduct=response.data
            })
            .catch(function(error){
                 console.log('Error :',error);
            })
            .finally(function(){

            });

    },
    getListType({commit},data){
        axios.get('/api/v1/product-type')
            .then((response)=>{
               data.listType=response.data;
            })
            .catch((error)=>{
                console.log('Error :',error);
            })
    },

    //get product by Id
    getTypeByID({commit},_this){
        axios.get('/api/v1/product-type/'+ _this.product_type_id)
        .then(response=>{
            _this.selectedType=response.data.name
        })
        .catch( error=> {
            console.log('Erorr:', error);
        })
    },
    getListSearch({commit},data){
        commit('GET_LIST_SEARCH',data);
    }

}

export default{
    getListCategory({commit},_this){
        axios.get('/api/v1/category')
        .then(function(response){
                _this.listCategory=response.data
            })
            .catch(function(error){
                 console.log('Error :',error);
            })
            .finally(function(){

            });   
    },
}
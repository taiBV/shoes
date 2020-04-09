export default{
    hanleLogin(state,data){
        if(data==0){
            state.isLogin=true
        }
        else{
            state.isLogin=false
        }
    }
}
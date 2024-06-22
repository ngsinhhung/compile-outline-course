function deleteSubjectRequirement(url){
    console.log(window.location);
    fetch(url, {
        method: 'delete'
    }).then(res => {
        if(res.status === 204){
            location.reload();
        }
    })
}
function pad(num) {
    num = num.toString();
    while (num.length < 2) num = "0" + num;
    return num;
}

export function formatTimestamp(created_at) {
    const date = new Date(created_at);
    const weekday = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return date.getFullYear() + '/'
        + pad(date.getMonth() + 1) + '/'
        + pad(date.getDate()) + ' ('
        + weekday[date.getDay()] + ') '
        + pad(date.getHours()) + ':'
        + pad(date.getMinutes()) + ':'
        + pad(date.getSeconds());
}
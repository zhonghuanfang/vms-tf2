import request from '@/utils/request'

export function listBatch(query) { return request({ url: '/order/batch/list', method: 'get', params: query }) }
export function getBatch(oid) { return request({ url: '/order/batch/' + oid, method: 'get' }) }
export function addBatch(data) { return request({ url: '/order/batch', method: 'post', data: data }) }
export function updateBatch(data) { return request({ url: '/order/batch', method: 'put', data: data }) }
export function delBatch(oids) { return request({ url: '/order/batch/' + oids, method: 'delete' }) }
export function lockBatch(data) { return request({ url: '/order/batch/lock', method: 'put', data: data }) }
export function unlockBatch(data) { return request({ url: '/order/batch/unlock', method: 'put', data: data }) }
export function submitReviewBatch(data) { return request({ url: '/order/batch/submitReview', method: 'put', data: data }) }
export function approveBatch(data) { return request({ url: '/order/batch/approve', method: 'put', data: data }) }
export function rejectBatch(data) { return request({ url: '/order/batch/reject', method: 'put', data: data }) }
export function listDetail(query) { return request({ url: '/order/batch/detail/list', method: 'get', params: query }) }
export function getDetail(oid) { return request({ url: '/order/batch/detail/' + oid, method: 'get' }) }
export function addDetail(data) { return request({ url: '/order/batch/detail', method: 'post', data: data }) }
export function updateDetail(data) { return request({ url: '/order/batch/detail', method: 'put', data: data }) }
export function delDetail(oids) { return request({ url: '/order/batch/detail/' + oids, method: 'delete' }) }
export function rejectDetail(data) { return request({ url: '/order/batch/detail/reject', method: 'put', data: data }) }
export function listSegment(query) { return request({ url: '/order/batch/segment/list', method: 'get', params: query }) }
export function saveSegment(data) { return request({ url: '/order/batch/segment/save', method: 'post', data: data }) }
export function listOrder(query) { return request({ url: '/order/batch/order/list', method: 'get', params: query }) }
export function batchSummary(query) { return request({ url: '/order/batch/summary', method: 'get', params: query }) }
export function listLog(query) { return request({ url: '/order/batch/log/list', method: 'get', params: query }) }

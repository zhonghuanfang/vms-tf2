import request from '@/utils/request'

// 查询厂商管理列表
export function listVendor(query) {
  return request({
    url: '/system/vendor/list',
    method: 'get',
    params: query
  })
}

// 查询厂商管理详细
export function getVendor(oid) {
  return request({
    url: '/system/vendor/' + oid,
    method: 'get'
  })
}

// 新增厂商管理
export function addVendor(data) {
  return request({
    url: '/system/vendor',
    method: 'post',
    data: data
  })
}

// 修改厂商管理
export function updateVendor(data) {
  return request({
    url: '/system/vendor',
    method: 'put',
    data: data
  })
}

// 删除厂商管理
export function delVendor(oid) {
  return request({
    url: '/system/vendor/' + oid,
    method: 'delete'
  })
}

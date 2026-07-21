import request from '@/utils/request'

// 查询凭证模版列表
export function listTemplate(query) {
  return request({
    url: '/system/template/list',
    method: 'get',
    params: query
  })
}

// 查询凭证模版详细
export function getTemplate(oid) {
  return request({
    url: '/system/template/' + oid,
    method: 'get'
  })
}

// 新增凭证模版
export function addTemplate(data) {
  return request({
    url: '/system/template',
    method: 'post',
    data: data
  })
}

// 修改凭证模版
export function updateTemplate(data) {
  return request({
    url: '/system/template',
    method: 'put',
    data: data
  })
}

// 删除凭证模版
export function delTemplate(oid) {
  return request({
    url: '/system/template/' + oid,
    method: 'delete'
  })
}

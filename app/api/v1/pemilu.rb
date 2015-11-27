module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :monitoring_organizations do
      desc "Return all monitoring organizations"
      get do
        m_organizations = Array.new
        
        # Prepare Conditions based on params
        validParams = {
          idPemantau: 'id_monitoring'
        }
        
        conditions = Hash.new
        validParams.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end
        
        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]
        
        MonitoringOrganization.includes(:region)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do | m_o|
            m_organizations << {
              idPemantau: m_o.id_monitoring,
              wilayah: {
                idWilayah: m_o.region_id,
                nama: m_o.region.name
              },
              pemantau: m_o.monitoring_name,
              pimpinan: m_o.leader_name,
              alamat: m_o.address,
              jml_pemantau: m_o.monitoring_counter,
              akreditasi: m_o.accreditation_num
            }
          end
          {
            result: {
              count: m_organizations,
              total: MonitoringOrganization.where(conditions).count,
              monitoringorganizations: m_organizations
            }
          }
      end
    end
  end
end
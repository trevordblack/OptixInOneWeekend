#ifndef IO_GEOMETRY_INSTANCE_H
#define IO_GEOMETRY_INSTANCE_H

#include <optix.h>
#include <optixu/optixpp.h>

#include "geometry/ioGeometry.h"
#include "matertial/ioMaterial.h"

class ioGeometryInstance
{
public:
    ioGeometryInstance() { }

    void init(optix::Context& context)
    {
        m_gi = context->createGeometryInstance();
    }

    optix::GeometryInstance get()
    {
        return m_gi;
    }

    void setGeometry(const ioGeometry& geo)
    {
       m_gi->setGeometry(geo.get()); 
    }

    void setMaterial(const ioMaterial& mat)
    {
        m_gi->setMaterialCount(1);
        m_gi->setMaterial(0, mat.get());
    }

private:
    optix::GeometryInstance m_gi;
}

#endif //!IO_GEOMETRY_INSTANCE_H

#ifndef IO_GEOMETRY_GROUP_H
#define IO_GEOMETRY_GROUP_H

#include <optix.h>
#include <optixu/optixpp.h>

#include "geometry/ioGeometryInstance.h"

class ioGeometryGroup
{
public:
    ioGeometryGroup() { }

    void init(optix::Context& context)
    {
        m_gg = context->createGeometryGroup();
        m_gg->setAcceleration(context->createAcceleration("Bvh"));
    }

    void addChild(const ioGeometryInstance& gi)
    {
        m_gg->setChildCount(m_numChildren + 1);
        m_gg->setChild(m_numChildren, gi.get());
        m_numChildren++;
    }

    optix::GeometryGroup get()
    {
        return m_gg;
    }

private:
    optix::GeometryGroup m_gg;
    int m_numChildren;
}

#endif //!IO_GEOMETRY_GROUP_H
